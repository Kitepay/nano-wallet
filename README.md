# Nano::Wallet

A library for creating and managing a wallet for the Nano cryptocurrency, offline. Lets you securely generate a seed and its corresponding accounts and keys.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nano-wallet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nano-wallet

## Usage

### Nano::Wallet

Used for managing a collection of accounts that belong to a seed.

```ruby
# Create a new wallet with a securely generated random seed
wallet = Nano::Wallet.with_random_seed

seed = "DFE531F385024EF302B8284A0AFC380E948D7DDE3FFFBD9F83F064B4823A8F6F"

# Create a wallet with the given seed
wallet = Nano::Wallet.new(seed)

# Add an account to the wallet
wallet.add_account!

# Add multiple accounts to the wallet
# .add_accounts(count)
wallet.add_accounts!(10_000)

# Retrieve generated accounts
wallet.accounts

# Retrieve an account at the given wallet index
# .account_at_index(index)
wallet.account_at_index(1974903)
```

### Nano::Account

Represents an account at the given index for the wallet's seed. Typically accessed through `Nano::Wallet` but can be used on its own as well.

Private and public keys are returned encoded as a binary string, due to how Ruby works. If you wish to convert them to a more human readable hex format, you can use `Nano::Util.bin_to_hex()`.

```ruby
# .new(seed, [index])
account = Nano::Account.new(seed, 0)

# Retrieve the account keys
priv_key = account.private_key
pub_key = account.public_key

# Human readable format
Nano::Util.bin_to_hex(priv_key)
Nano::Util.bin_to_hex(pub_key)

# The encoded address typically used
# .address([prefix])
account.address

# You can also set the address prefix
account.address('nano')
account.address('ban')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kitepay/nano-wallet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nano::Wallet project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Kitepay/nano-wallet/blob/master/CODE_OF_CONDUCT.md).
