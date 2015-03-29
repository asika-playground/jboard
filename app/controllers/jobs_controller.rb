class JobsController < ApplicationController

    before_action :set_job, :only => [ :show, :edit, :update, :destroy]

    def index
        @jobs = Job.page(params[:page]).per(5)

        @job = Job.new
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)

        if @job.save
            flash[:notice] = "Job created successfully."

            redirect_to jobs_path
        else
            @jobs = Job.page(params[:page]).per(5)

            render :action => :new
        end
    end

    def show
    end

    def destroy
        @job.destroy

        flash[:alert] = "Job deleted successfully."
        redirect_to jobs_path
    end

    def edit
        @jobs = Job.page(params[:page]).per(5)
    end

    def update
        if @job.update(job_params)
            flash[:notice] = "Job updated successfully."

            redirect_to jobs_path
        else
            @jobs = Job.page(params[:page]).per(5)

            render :action => :edit
        end
    end

    def set_job
        @job = Job.find(params[:id])
    end

    def job_params
        params.require(:job).permit(:title,
            :company,
            :location,
            :min_salary,
            :url,
            :expire,
            :description)
    end

end
