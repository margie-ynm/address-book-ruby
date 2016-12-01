class Contact

attr_reader(:first_name, :last_name, :job_title, :company)

  define_method(:initialize) do |parameters|
    @first_name = parameters.fetch(:first_name)
    @last_name = parameters.fetch(:last_name)
    @job_title = parameters.fetch(:job_title)
    @company = parameters.fetch(:company)

  end
end
