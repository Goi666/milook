class CompanyController < ApplicationController
    def index
        @com = Company.all
    end

    def show
        @com = Company.find_by_id(params[:id])
        @comment = Comment.where(company_id: params[:id]).all
        r = Evaluation.find_by(company_id: params[:id])

        #chart-radar
        genre = ['環境','給料','残業','上司','社風','経営方針','ヤベーやつ','その他']
        aData = [r.environment,r.salary,r.overtime,r.boss,r.corporate_style,r.management,r.dangerous,r.other]
    
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

    # def evaluation_params
    #     params.require(:evaluation).permit(:environment, :salary, :overtime, :boss, :corporate_style, :management, :dangerous, :other)
    #     logger.debug("▼company_params")
    # end
    
      # POST /company & evaluation
      # POST /users.json
    def create

        @company = Company.new(company_params)
        logger.debug("///////////////////////////▼@company in ///////////////////")
        logger.debug(@company.evaluations.environment)

        if @company.save
            redirect_to company_index_path
            #format.html { redirect_to @company, notice: 'Company was successfully created.' }
        else
            format.html { render :new }
        end
    end

    private
    def company_params
        logger.debug("11111")
        logger.debug(evaluations_attributes: [:environment,:salary,:overtime])
        logger.debug(evaluations_attributes: :salary)
        logger.debug(evaluations_attributes: :overtime)

        params.require(:company).
        permit(:company_name, :company_type, 
            evaluations_attributes:
                [:id,:environment,:salary,:overtime,:boss,:corporate_style,:management,:dangerous,:other]
        )
    end
end
