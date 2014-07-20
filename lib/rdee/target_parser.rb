
module RDee
  module TargetParser

    def parse(value)
      target = target_for(value).to_sym
      version = version_for(value)
      host = host_for(value)
      return  target, version, host
    end

    private

    def target_for(value)
      value.to_s.split(/\d+/)[0]
    end

    def version_for(value)
      value.to_s.gsub(target_for(value), '').split(/_/)[0]
    end

    def host_for(value)
      host = value.to_s.split(/_/).slice(1..-1)
      host_lookup[host.join('_').to_sym] if host
    end

    def host_lookup
      @host_lookup ||= {
        win81: 'Windows 8.1',
        win8: 'Windows 8',
        win7: 'Windows 7',
        winxp: 'Windows XP',
        snow_leopard: 'OS X 10.6',
        mountain_lion: 'OS X 10.8',
        mavricks: 'OS X 10.9',
        linux: 'linux'
      }
    end
  end
end
