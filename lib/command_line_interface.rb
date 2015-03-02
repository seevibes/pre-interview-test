class CommandLineInterface
  # CommandLineInterface class is decoupled from specific searcher and result model classes;
  # any searcher class whose instances respond to "#fetch_results", and any results model class whose instances respond to "#to_s", can be injected as dependencies for this program.
  def initialize(args={})
    @result_class = args[:result_class]
    @searcher_class = args[:searcher_class]
    @results_limit = args[:results_limit] || nil
  end

  def search(query)
    searcher = @searcher_class.new(query)
    results = searcher.fetch_results
    if results.any?
      if @results_limit.is_a? Integer
        results = results[0, @results_limit]
      end
      puts results.map {|result| @result_class.new(result)}
    else
      puts "No results found"
    end
  end
end
