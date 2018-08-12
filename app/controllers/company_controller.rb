class CompanyController < ApplicationController

    PER = 10

    def index
        @com = Company.page(params[:page]).per(PER)

        #average
    end

    def show
        
        @com = Company.find_by_id(params[:id])

        data = Evaluation.where(company_id: params[:id]).all
        dtc = Evaluation.where(company_id: params[:id]).count

        @comments = Comment.where(company_id: params[:id]).page(params[:page]).per(PER)
        # if user_signed_in?
        #     @user = User.find(@current_user)
        # end

        # @company = Company.new
        @company = @com
        @comment = Comment.new #②
        #@comments = @com.comments.build

        environment = 0
        salary = 0
        overtime = 0
        boss = 0
        corporate_style = 0 
        management = 0
        dangerous = 0
        other = 0

        data.each do |g|
            environment += g.environment
            salary += g.salary
            overtime += g.overtime
            boss += g.boss
            corporate_style += g.corporate_style
            management += g.management
            dangerous += g.dangerous
            other += g.other
        end 

        @environment = environment / dtc
        @salary = salary / dtc
        @overtime = overtime / dtc
        @boss = boss /dtc
        @corporate_style = corporate_style / dtc
        @management = management /dtc
        @dangerous = dangerous / dtc
        @other = other /dtc

        @average = @environment + @salary + @overtime + @boss + @corporate_style + @management + @dangerous + @other

        #chart-radar
        genre = ['環境','給料','残業','上司','社風','経営方針','やばいやつ','その他']
        aData = [@environment,@salary,@overtime,@boss,@corporate_style,@management,@dangerous,@other]
    
        @graph = LazyHighCharts::HighChart.new('graph') do |f|
          f.chart(polar: true,type:'line') #グラフの種類
          f.pane(size:'90%')                  #グラフサイズの比
          f.title(text: "")         #タイトル
          f.xAxis(categories: genre,tickmarkPlacement:'on')    
          f.yAxis(gridLineInterpolation: 'polygon',lineWidth:0,min:0,max:10) #各項目の最大値やら
          f.series(name:'平均評価',data: aData,pointPlacement:'on')#各データ
          f.legend(align: 'right',
                verticalAlign: 'top',
                y: 70,
                layout: 'vertical')
        end
    end

    def new
        @company = Company.new
        @company.evaluations.build
    end
    
      # POST /company & evaluation
      # POST /users.json
    def create

        @company = Company.new(company_params)

        if @company.save
            redirect_to company_index_path
            #format.html { redirect_to @company, notice: 'Company was successfully created.' }
        else
            render new_company_path
        end
    end

    def data
        @com = Company.find_by_id(params[:id])

        @evaluation = Evaluation.new
    end

    def push
        @evaluation = Evaluation.new(evaluation_params)

        if @evaluation.save
            redirect_to company_index_path
        else
            render :data
        end
    end

    def destroy
        @com = Company.find_by(id: params[:id])
        if @com.destroy
            redirect_to(company_index_path)
        else
            render "/"
        end
    end

    private
    def company_params
        params.require(:company).
        permit(:company_name, :company_type, :image, :user_id,
            evaluations_attributes:
                [:environment,:salary,:overtime,:boss,:corporate_style,:management,:dangerous,:other]
        )
    end

    def evaluation_params
        params.require(:evaluation).
            permit(:company_id,:environment,:salary,:overtime,:boss,:corporate_style,:management,:dangerous,:other)
    end

    ##evaluationの平均点をメソッドとしてまとめておく
    def average

    end

end
