
abstract class BaseResult<Data, Error> {
  const BaseResult();

  T when<T>({
    required T Function(Data data) success,
    required T Function(Error error) failure,
  });
}