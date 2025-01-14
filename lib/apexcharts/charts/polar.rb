module Apexcharts
  class PolarChart < BaseChart
    def initialize data, options={}
      @series = sanitize_data(data)
      @options = Utils::Hash.camelize_keys(
                   Utils::Hash.deep_merge(
                     build_options(x_sample, options),
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )
    end

    def chart_type
    end

  protected

    def sanitize_data(data)
      Apexcharts::PolarSeries.new(data).sanitized
    end

    def x_sample
    end
  end
end

