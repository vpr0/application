
module Developer
  attr_accessor :made
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@instances = 0

    def instances
      @@instances
    end

    def instances=(inst)
      @@instances = inst
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances += 1
    end
  end
end

#================================================================================
#  !!!!!!!!!!!!!!!!!!!!! ДЕВЯТЫЙ УРОК !!!!!!!!!!!!!!!!!!!!!

# Выполнить следующие задачи:
# 1 - Написать модуль, содержащий 2 метода, которые можно вызывать на урвне класса:
# - метод att_accessor_with_history. Динамически создает геттеры и сеттеры для любого кол-ва атрибутов,
# при этом сеттер сохраняет все значения инстанс-переменной при изменении этого значения.
# Также должен быть метод <имя_атрибута>_history, который возвращает массив всех значений данной переменной.
# - метод strong_attr_acessor, который принимает имя атрибута и его класс.
# При этом создается геттер и сеттер для одноименной инстанс-переменной, но сеттер проверяет
# тип присваемоего значения. Если тип отличается от того, который указан вторым параметром,
# то выбрасывается исключение. Если тип совпадает, то значение присваивается.

module Metaprogram
  def attr_accessor_with_history(*attrs)
    attrs.each do |attribute|
      define_method(attribute) { instance_variable_get("@#{attribute}") }
      define_method("#{attribute}_history") { instance_variable_get("@#{attribute}_history") }
      define_method("#{attribute}=") do |val|
        instance_variable_set("@#{attribute}", val)
        history = instance_variable_get("@#{attribute}_history") || []
        instance_variable_set("@#{attribute}_history", history << val)
      end
    end
  end

  def strong_attr_accessor(attribute, attr_class)
    define_method(attribute) { instance_variable_get("@#{attribute}") }
    define_method("#{attribute}=") do |val|
      raise 'wrong class' if val.class != attr_class
      instance_variable_set("@#{attribute}", val)
    end
  end
end

# ========================================================================================
# 2 - Подключить модуль в класс и продемонстрировать применение этих методов.
#     Написать модуль Validation, который:
# 1 - Содержит метод класса validate. Этот метод принимает в качестве параметров имя проверяемого атрибута,
# а также тип валидации и при необходимости дополнительные параметры.
#   Возможные типы валидаций:
# - presence - требует, чтобы значение атрибута было не nil и не пустой строкой.
# Пример использования: validate :name, :presence
# - format (при этом отдельным параметром задается регулярное выражение для формата).
# Треубет соответствия значения атрибута заданному регулярному выражению. Пример:
# validate :number, :format, /A-Z{0,3}/
# - type (третий параметр - класс атрибута).
# Требует соответствия значения атрибута заданному классу.
# Пример: validate :station, :type, RailwayStation
# 2 - Содержит инстанс-метод validate!, который запускает все проверки (валидации),
# указанные в классе через метод класса validate.
# В случае ошибки валидации выбрасывает исключение с сообщением о том,
# какая именно валидация не прошла.
# 3 - Содержит инстанс-метод valid? который возвращает true,
# если все проверки валидации прошли успешно и false, если есть ошибки валидации.
# Заменить валидации в проекте железной дороги на этот модуль и методы из него.
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(_name, _type, *_params)
      ''
    end
  end

  module InstanceMethods
    def validate!
      ''
    end

    def valid?
      validate!
    rescue StandardError => e
      puts e.message
      false
    end
  end
end
